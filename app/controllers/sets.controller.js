const db = require("../models");
const Set = db.sets;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    if (!req.body.nazwa) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }

    const set = {
        nazwa: req.body.nazwa,
        owner: req.body.owner,
        jezyk: req.body.jezyk
    };

    Set.create(set)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the new set."
            });
        });
};

exports.findAll = (req, res) => {
    const nazwa = req.query.nazwa;
    var condition = nazwa ? { nazwa: { [Op.like]: `%${nazwa}%` } } : null;

    Set.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving sets."
            });
        });
};

exports.findOne = (req, res) => {
    const id = req.params.id;

    Set.findByPk(id)
        .then(data => {
            if (data) {
                res.send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find set with id=${id}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error retrieving set with id=" + id
            });
        });
};

exports.update = (req, res) => {
    const id = req.params.id;

    Set.update(req.body, {
        where: { id: id }
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Set was updated successfully."
                });
            } else {
                res.send({
                    message: `Cannot update set with id=${id}. Maybe set was not found or req.body is empty!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating set with id=" + id
            });
        });
};

exports.delete = (req, res) => {
    const id = req.params.id;

    Set.destroy({
        where: { id: id }
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Set was deleted successfully!"
                });
            } else {
                res.send({
                    message: `Cannot delete set with id=${id}. Maybe set was not found!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Could not delete set with id=" + id
            });
        });
};

exports.deleteAll = (req, res) => {
    Set.destroy({
        where: {},
        truncate: false
    })
        .then(nums => {
            res.send({ message: `${nums} Sets were deleted successfully!` });
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while removing all sets."
            });
        });
};
