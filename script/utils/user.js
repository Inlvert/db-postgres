const _ = require('lodash');

function generateUsersInsert(user) {
  const { name : { first, last }, email, dob: { date }, gender} = user

  const currentBalance = _.random(100, 5000);
  const height = _.random(0.3, 2, true);
  const weight = _.random(50, 100, true);

  return `('${first}', '${last}', '${email}', '${date}', ${gender === 'male'},
  ${currentBalance}, ${height}, ${weight})`
}

module.exports.generateUsersInsert = generateUsersInsert;