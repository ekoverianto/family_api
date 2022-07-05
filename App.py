from flask import Flask, jsonify, request
import mysql.connector
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

# Koneksi ke basis data orang
db = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '',
    database = 'orang'
)

# Cek koneksi berhasil terhubung atau tidak
# Jika berhasil bisa dikomen saja perintah baris ke 14-17
# if db.is_connected:
#     print('Terkoneksi')
# else:
#     print('Gagal Terkoneksi')

# Class keluarga yang terdiri dari dua metode, yaitu get untuk menampilkan data
# dan post untuk menyisipkan data
class Keluarga(Resource):
    def get(self):
        cur = db.cursor()
        cur.execute("SELECT * FROM keluarga")
        keluarga = cur.fetchall()
        res = jsonify(keluarga=keluarga)
        res.status_code = 200
        return res

    def post(self):
        _nama = request.form['nama']
        _jenis_kelamin = request.form['jenis_kelamin']
        _id_parent = request.form['id_parent']

        if request.method == 'POST':
            query = "INSERT INTO keluarga (nama, jenis_kelamin, id_parent) VALUES (%s, %s, %s)"
            data = (_nama, _jenis_kelamin, _id_parent,)
            db.cursor().execute(query, data)
            db.commit()
            res = jsonify("Data Berhasil Disimpan")
            res.status_code = 200
            return res
        else:
            res = jsonify('Data Gagal Disimpan')
            return res


api.add_resource(Keluarga, '/keluarga', endpoint='keluarga')

if __name__ == '__main__':
    app.run(debug=True)
