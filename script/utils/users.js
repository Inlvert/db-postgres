const _ = require('lodash');
const generationConfig = require("../../configs/generation.json")

const { users: { minBalance, maxBalance, isBalanceFloating, minHeight, maxHeight, isHeightFloating, minWeight, maxWeight, isWeightFloating } } = generationConfig;


function generateUsersInsert(user) {
  const { name : { first, last }, email, dob: { date }, gender} = user

  const currentBalance = _.random(minBalance, maxBalance, isBalanceFloating);
  const height = _.random(minHeight, maxHeight, isHeightFloating);
  const weight = _.random(minWeight, maxWeight, isWeightFloating);

  return `('${first}', '${last}', '${email}', '${date}', ${gender === 'male'},
  ${currentBalance}, ${height}, ${weight})`
}

const generateUsersSql = (users) => users.map((user) => generateUsersInsert(user)).join(',')

module.exports.generateUsersInsert = generateUsersInsert;
module.exports.generateUsersSql = generateUsersSql;