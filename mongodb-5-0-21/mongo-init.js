test = db.getSiblingDB("test");
test.createUser({
  user: "root",
  pwd: "hello123",
  roles: [{role: "readWrite", db: "test"}],
});
test.createCollection("Tests");

graylog = db.getSiblingDB("graylog");
test.createUser({
  user: "root",
  pwd: "hello123",
  roles: [{role: "dbOwner", db: "graylog"}],
});
