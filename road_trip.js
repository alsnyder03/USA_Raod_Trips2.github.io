// road_trip.js
const db = []; // Simulated database for road trip records

function planRoadTrip() {
    const destination = document.getElementById('destination').value;
    const distance = parseInt(document.getElementById('distance').value);

    const trip = {
        destination: destination,
        distance: distance
    };

    insertRecord(trip);
}

function insertRecord(record) {
    db.push(record);
    displayRecords();
}

function displayRecords() {
    const outputDiv = document.getElementById('output');
    outputDiv.innerHTML = '<h2>Road Trip Records</h2>';

    if (db.length === 0) {
        outputDiv.innerHTML += '<p>No records found.</p>';
    } else {
        outputDiv.innerHTML += '<ul>';
        db.forEach((record, index) => {
            outputDiv.innerHTML += `<li>${index + 1}. Destination: ${record.destination}, Distance: ${record.distance} miles</li>`;
        });
        outputDiv.innerHTML += '</ul>';
    }
}

// Sample function for update operation (not implemented here)
function updateRecord() {
    // Code for updating a record
}

// Sample function for delete operation (not implemented here)
function deleteRecord() {
    // Code for deleting a record
}

// Sample function for search operation (not implemented here)
function searchRecord() {
    // Code for searching a record
}