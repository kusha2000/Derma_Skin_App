from flask import Flask, request, jsonify
import os
import numpy as np
import tensorflow.keras as K
from tensorflow.keras.preprocessing import image
from tensorflow.keras.preprocessing.image import img_to_array
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all origins

# Load the model
model = K.models.load_model('./Deeplearning/Skin_Disease_AI/max_acc.keras')

# Define the types of predictions
types = ['Actinic keratosis', 'Melanocytic nevus', 'Melanoma', 'Squamous cell carcinoma', 'Tinea Ringworm Candidiasis', 'Vascular lesion']

@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    # Save the file temporarily
    file_path = os.path.join('temp', file.filename)
    file.save(file_path)

    # Load and preprocess the image
    img = image.load_img(file_path, target_size=(299, 299))
    x = img_to_array(img)
    x = K.applications.xception.preprocess_input(x)

    # Predict class probabilities
    prediction = model.predict(np.array([x]))[0]
    test_pred = np.argmax(prediction)

    # # Sort and display top predictions
    # result = [(types[i], float(prediction[i]) * 100.0) for i in range(len(prediction))]
    # result.sort(reverse=True, key=lambda x: x[1])

    # # Format the result
    # response = {'predictions': [{'class': cls, 'probability': prob} for cls, prob in result]}
    # return jsonify(response)

    highest_prob_index = np.argmax(prediction)
    highest_prob_class = types[highest_prob_index]
    highest_prob_value = float(prediction[highest_prob_index]) * 100.0

    # Format the result
    response = {
        'class': highest_prob_class,
        'probability': f"{highest_prob_value:.2f}"  # Format to 4 decimal places
    }
    return jsonify(response)

if __name__ == '__main__':
    os.makedirs('temp', exist_ok=True)  # Create temp directory if it doesn't exist
    app.run(host='0.0.0.0', port=5000)  # Make the server available on all network interfaces
