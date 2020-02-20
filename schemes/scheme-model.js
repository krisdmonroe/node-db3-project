const db = require("./dbConfig.js")

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
}  

function find() {
    return db("schemes")
  }
  
  function findById(id) {
    return db("schemes")
    .where({ id })
    .first();
  }
  
  function findSteps(id) {
    return db("steps as s")
    .join("schemes", "schemes.id" , "=", "s.scheme_id")
    .select('schemes.scheme_name as Sheme', 's.step_number as Step Number', 's.instructions')
    .where("scheme_id", id)
  }
  
  function add(scheme) {
    return db("schemes").insert(scheme, "id")
  }
  
  function update(changes, id) {
    return db("schemes")
        .where({ id })
        .update(changes)
  }
  
  function remove(id) {
    return db("schemes")
        .where({ id })
        .del();
  }
  