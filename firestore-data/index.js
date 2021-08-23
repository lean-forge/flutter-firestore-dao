const admin = require("firebase-admin");

const serviceFile = require("./service.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceFile),
});

const firestore = admin.firestore();
const collectionName = "recipes";

async function importData(data) {
  if (!data || typeof data !== "object") return;
  const promises = Object.keys(data).map(async (idx) => {
    const documentKey = `recipe-${idx}`;
    // Set the ID dynamically
    const documentValue = { ...data[idx], recipeID: documentKey };
    firestore
      .collection(collectionName)
      .doc(documentKey)
      .set(documentValue)
      .then((res) => console.log(`Added document with key '${documentKey}'`))
      .catch((error) => console.error(`Error while adding document with key '${documentKey}': ${error}`));
  });
  await Promise.all(promises);
}

const recipes = require("./recipes.json");
importData(recipes);
