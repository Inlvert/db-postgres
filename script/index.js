const { Client } = require("pg");
const fs = require("fs/promises");
const { loadUsers } = require("./api/index");
const { generateUsersInsert } = require("./utils/user");

const config = {
  user: "postgres", // default process.env.PGUSER || process.env.USER
  password: "postgres", //default process.env.PGPASSWORD
  host: "localhost", // default process.env.PGHOST
  port: 5432, // default process.env.PGPORT
  database: "first_pg_db", // default process.env.PGDATABASE || user
};

const client = new Client(config);

async function generateData() {
  const resetDbString = await fs.readFile(`./script/reset_db.sql`, { encoding: "utf-8" });

  await client.connect();

  await client.query(resetDbString);

  const users = await loadUsers();

  console.log(users);

  // const users = [
  //   {
  //     firstName: "Js",
  //     lastName: "Jsonenko",
  //     email: "json@mail.com",
  //     birthday: "1990-01-01",
  //     isMale: true,
  //     currentBalance: 10000,
  //     height: 1.8,
  //     weight: 70,
  //   },
  //   {
  //     firstName: "Js2",
  //     lastName: "Jsonenko2",
  //     email: "json2@mail.com",
  //     birthday: "1990-01-01",
  //     isMale: true,
  //     currentBalance: 12000,
  //     height: 1.82,
  //     weight: 72,
  //   },
  // ];

  const usersSqlInsert = users.map(
    (user) => generateUsersInsert(user));

  const userInsertString = usersSqlInsert.join(",");

  console.log(userInsertString);

  const { rows } = await client.query(`
    INSERT INTO users (
      first_name,
      last_name,
      email,
      birthday,
      is_male,
      current_balance,
      height,
      weight
    )
    VALUES
    ${userInsertString}
    RETURNING *
  `);

  await client.end();
}

generateData();
