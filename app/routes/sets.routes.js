module.exports = app => {
    const sets = require("../controllers/sets.controller.js");

    var router = require("express").Router();

    router.post("/", sets.create);

    router.get("/", sets.findAll);

    router.get("/:id", sets.findOne);

    router.put("/:id", sets.update);

    router.delete("/:id", sets.delete);

    router.delete("/", sets.deleteAll);

    app.use('/api/sets', router);
};