const db = require("../models");
const Language = db.languages;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    if (!req.body.jezyk) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }

    const language = {
        jezyk: req.body.jezyk
    };

    Language.create(language)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the new language."
            });
        });
};

exports.findAll = (req, res) => {
    const jezyk = req.query.jezyk;
    var condition = jezyk ? { jezyk: { [Op.like]: `%${jezyk}%` } } : null;

    Language.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving languages."
            });
        });
};

exports.findOne = (req, res) => {
    const id = req.params.id;

    Language.findByPk(id)
        .then(data => {
            if (data) {
                res.send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find language with id=${id}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error retrieving word language id=" + id
            });
        });
};

exports.update = (req, res) => {
    const id = req.params.id;

    Language.update(req.body, {
        where: { id: id }
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Language was updated successfully."
                });
            } else {
                res.send({
                    message: `Cannot update language with id=${id}. Maybe it was not found or req.body is empty!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating language with id=" + id
            });
        });
};

exports.delete = (req, res) => {
    const id = req.params.id;

    Language.destroy({
        where: { id: id }
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Language was deleted successfully!"
                });
            } else {
                res.send({
                    message: `Cannot delete language with id=${id}. Maybe it was not found!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Could not delete language with id=" + id
            });
        });
};

exports.deleteAll = (req, res) => {
    Language.destroy({
        where: {},
        truncate: false
    })
        .then(nums => {
            res.send({ message: `${nums} Languages were deleted successfully!` });
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while removing all languages."
            });
        });
};
