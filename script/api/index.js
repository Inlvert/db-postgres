const axios = require("axios");

const http = axios.create({
  baseURL: "https://randomuser.me/api/",
});

module.exports.loadUsers = async () => {
  const result = await http.get("?results=100&seed=xz11-1&page=1");

  const {
    data: { results },
  } = result;

  return results;
};
