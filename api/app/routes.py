# app/routes.py
from flask import Blueprint, request, jsonify
from . import mongo  # Import mongo from the current package
import requests
import base64
from datetime import datetime

main = Blueprint('main', __name__)

@main.route('/upload', methods=['POST'])
def upload_image():
    print("Received upload request.")
    data = request.json
    image_data = data.get('image')
    location = data.get('location')

    if not image_data or not location:
        print("Error: Image and location are required.")
        return jsonify({"error": "Image and location are required"}), 400

    # Decode the image
    try:
        image = base64.b64decode(image_data)
        print("Image decoded successfully.")
    except Exception as e:
        print(f"Error decoding image: {e}")
        return jsonify({"error": "Invalid image data"}), 400

    # Send image to Hugging Face model
    headers = {
        "Authorization": f"Bearer {Config.HUGGING_FACE_API_TOKEN}"
    }
    print("Sending image to Hugging Face model...")
    response = requests.post(Config.HUGGING_FACE_API_URL, headers=headers, files={'file': image})

    if response.status_code != 200:
        print(f"Error calling Hugging Face API: {response.status_code} - {response.text}")
        return jsonify({"error": "Error calling Hugging Face API"}), 500

    prediction = response.json()
    print("Received prediction from Hugging Face API.")

    # Store image, prediction, and location in MongoDB
    mongo.db.images.insert_one({
        "image": image_data,
        "prediction": prediction,
        "location": location,
        "timestamp": datetime.now()
    })
    print("Image, prediction, and location stored in MongoDB.")

    return jsonify({"message": "Image uploaded and processed", "prediction": prediction}), 200

@main.route('/images', methods=['GET'])
def get_images():
    print("Fetching all images from the database.")
    images = mongo.db.images.find()
    result = []
    for image in images:
        result.append({
            "image": image['image'],
            "prediction": image['prediction'],
            "location": image['location'],
            "timestamp": image['timestamp']
        })

    print(f"Retrieved {len(result)} images.")
    return jsonify(result), 200