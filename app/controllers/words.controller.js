const db = require("../models");
const Word = db.words;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    if (!req.body.slowko) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
}

    const word = {
        slowko: req.body.slowko,
        tlumaczenie: req.body.tlumaczenie,
        jezyk: req.body.jezyk,
        zestaw: req.body.zestaw,
        kategoria: req.body.kategoria
    };

    Word.create(word)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the word."
            });
        });
};

exports.findAll = (req, res) => {
    const slowko = req.query.slowko;
    var condition = slowko ? { slowko: { [Op.like]: `%${slowko}%` } } : null;

    Word.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving words."
            });
        });
};

exports.findOne = (req, res) => {
    const id = req.params.id;

    Word.findByPk(id)
        .then(data => {
            if (data) {
                res.send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find word with id=${id}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error retrieving word with id=" + id
            });
        });
};

exports.update = (req, res) => {
    const id = req.params.id;

    Word.update(req.body, {
        where: { id: id }
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Word was updated successfully."
                });
            } else {
                res.send({
                    message: `Cannot update word with id=${id}. Maybe word was not found or req.body is empty!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating word with id=" + id
            });
        });
};

exports.delete = (req, res) => {
    const id = req.params.id;

    Word.destroy({
        where: { id: id }
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Word was deleted successfully!"
                });
            } else {
                res.send({
                    message: `Cannot delete word with id=${id}. Maybe word was not found!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Could not delete word with id=" + id
            });
        });
};

exports.deleteAll = (req, res) => {
    Word.destroy({
        where: {},
        truncate: false
    })
        .then(nums => {
            res.send({ message: `${nums} Words were deleted successfully!` });
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while removing all words."
            });
        });
};
