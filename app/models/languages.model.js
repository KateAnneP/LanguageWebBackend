module.exports = (sequelize, Sequelize) => {
    const Language = sequelize.define("language", {
        jezyk: {
            type: Sequelize.STRING
        }
    });

    return Language;
};