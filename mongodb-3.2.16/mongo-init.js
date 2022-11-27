test = db.getSiblingDB("test");
test.createUser({
  user: "root",
  pwd: "hello123",
  roles: [{role: "readWrite", db: "test"}],
});
test.createCollection("Tests");
