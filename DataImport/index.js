const admin = require('./node_modules/firebase-admin');
const serviceAccount = require("./serviceAccountKey.json");
const AQIdata = require("./AQI.json");

const collectionKey = "AQIChart"; //name of the collection

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://learnozone-591b1.firebaseio.com"
  });

  const firestore = admin.firestore();
  const settings = {timestampsInSnapshots: true};
  firestore.settings(settings);

  //Checking if any data exists in data file and if it is object type
  if (AQIdata && (typeof AQIdata === "object")) {
    Object.keys(AQIdata).forEach(docKey => { //Loop on data object
     firestore.collection(collectionKey).doc(docKey).set(AQIdata[docKey]) //Calling Firestore API to store each document, setting collection name and setting document name/key. 
     .then((res) => {
        console.log("Document " + docKey + " successfully written!");
    }).catch((error) => {
       console.error("Error writing document: ", error);
    });
    });

  }