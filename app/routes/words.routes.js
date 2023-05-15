module.exports = app => {
    const words = require("../controllers/words.controller.js");

    var router = require("express").Router();

    //Tworzenie nowego słówka
    router.post("/", words.create);

    //Wyszukiwanie wszystkich słówek
    router.get("/", words.findAll);

    //Wyszkuaj słówko po id
    router.get("/:id", words.findOne);

    //Zaktualizuj słówko
    router.put("/:id", words.update);

    //Usuń słówko po id
    router.delete("/:id", words.delete);

    //Usuń wszystkie słówka
    router.delete("/", words.deleteAll);

    app.use('/api/words', router);
};