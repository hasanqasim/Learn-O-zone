const admin = require('./node_modules/firebase-admin');
const serviceAccount = require("./serviceAccountKey.json");
const collectionKey = "AQIChart"; //name of the collection
const quizCollectionKey = "Quizzes"; //name of the quiz collection
const AQIdata = require("./AQI.json");
const QuizData = require("./Quiz.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://learnozone-591b1.firebaseio.com"
  });

  const firestore = admin.firestore();
  const settings = {timestampsInSnapshots: true};
  firestore.settings(settings);

  //Checking if any data exists in AQIdata file and if it is object type
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


if (QuizData && (typeof QuizData === "object")) {
  Object.keys(QuizData).forEach(docKey => {

    const obj = QuizData[docKey];
    console.log(obj);
    const answersArray = []
    Object.keys(obj).forEach(field => {

      if (field === "Correct Answer"){
        answersArray.push(obj[field]);
      }
      if (field === "Option1"){
        answersArray.push(obj[field]);
      }
      if (field === "Option2"){
        answersArray.push(obj[field]);
      }
      if (field === "Option3"){
        answersArray.push(obj[field]);
      }
      

    });

    const newObj = {
      QuizType: obj["Quiz Type"],
      Question: obj["Question"],
      Answers: answersArray,
      Reason: obj["Reason"]
    }

    firestore.collection(quizCollectionKey).doc(docKey).set(newObj) //Calling Firestore API to store each document, setting collection name and setting document name/key. 
    .then((res) => {
       console.log("Document " + docKey + " successfully written!");
   }).catch((error) => {
      console.error("Error writing document: ", error);
   });

  });
}
    

  