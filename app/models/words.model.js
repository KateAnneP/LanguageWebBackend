module.exports = (sequelize, Sequelize) => {
    const Word = sequelize.define("word", {
        slowko: {
            type: Sequelize.STRING
        },
        tlumaczenie: {
            type: Sequelize.STRING
        },
        jezyk: {
            type: Sequelize.INTEGER
        },
        zestaw: {
            type: Sequelize.INTEGER
        },
        kategoria: {
            type: Sequelize.INTEGER
        }
    });

    return Word;
};