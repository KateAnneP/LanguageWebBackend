module.exports = (sequelize, Sequelize) => {
    const Langauge = sequelize.define("language", {
        jezyk: {
            type: Sequelize.STRING
        }
    });

    return Langauge;
};