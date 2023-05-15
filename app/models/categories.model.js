module.exports = (sequelize, Sequelize) => {
    const Category = sequelize.define("category", {
        nazwa: {
            type: Sequelize.STRING
        }
    });

    return Category;
};