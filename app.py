from flask import Flask, request, jsonify
from pymongo import MongoClient
from bson.objectid import ObjectId  # For handling MongoDB ObjectId

app = Flask(__name__)

# MongoDB Atlas connection string
mongo_uri = 'mongodb+srv://heraththilankadilshan:IT3t599ShESlw4nw@fypdb.tojh5.mongodb.net/?retryWrites=true&w=majority&appName=fypdb'
client = MongoClient(mongo_uri)

# Select the database and collection
db = client['fypdb']
collection = db['test1']  # Replace 'test1' with the name of your collection

@app.route('/')
def home():
    return "Connected to MongoDB Atlas! Thilanka DB HTG"

# Route to insert data into MongoDB
@app.route('/add_data', methods=['POST'])
def add_data():
    try:
        # Get JSON data from the request
        data = request.json

        # Insert data into the MongoDB collection
        result = collection.insert_one(data)

        # Return a success message with the inserted document's ID
        return jsonify({'message': 'Data inserted successfully!', 'data_id': str(result.inserted_id)})
    except Exception as e:
        return jsonify({'error': str(e)})

# Route to retrieve all data from MongoDB
@app.route('/get_all_data', methods=['GET'])
def get_all_data():
    try:
        # Retrieve all documents from the MongoDB collection
        documents = collection.find()

        # Convert the documents to JSON format
        data_list = []
        for document in documents:
            document['_id'] = str(document['_id'])  # Convert ObjectId to string
            data_list.append(document)

        return jsonify({'data': data_list})
    except Exception as e:
        return jsonify({'error': str(e)})

# Route to retrieve data from MongoDB by ID
@app.route('/get_data/<string:data_id>', methods=['GET'])
def get_data_by_id(data_id):
    try:
        # Retrieve the specific document by its ID from the MongoDB collection
        document = collection.find_one({'_id': ObjectId(data_id)})

        if document:
            # Convert the document to JSON format and remove the '_id' field from the result
            document['_id'] = str(document['_id'])
            return jsonify({'data': document})
        else:
            return jsonify({'message': 'No data found with the given ID'}), 404
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
