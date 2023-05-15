module.exports = (sequelize, Sequelize) => {
    const Set = sequelize.define("set", {
        nazwa: {
            type: Sequelize.STRING
        },
        owner: {
            type: Sequelize.STRING
        },
        jezyk: {
            type: Sequelize.INTEGER
        }
    });

    return Set;
};