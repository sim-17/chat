from flask import Flask
from flask_restful import Resource, Api
from flask_restful import reqparse
# from flask.ext.mysql import MySQL
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'chat'
app.config['MYSQL_DATABASE_PASSWORD'] = 'cht;470:ive'
app.config['MYSQL_DATABASE_DB'] = 'chat'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)

api = Api(app)


class DeleteUser(Resource):
    def post(self):
        try:
            # Parse the arguments

            parser = reqparse.RequestParser()
            parser.add_argument('user_name', type=str, help='UserName pour authentification')
            parser.add_argument('user_pwd', type=str, help='Password pour authentification')
            args = parser.parse_args()

            _userName = args['user_name']
            _userPassword = args['user_pwd']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spDeleteUser', (_userName, _userPassword,))
            data = cursor.fetchall()

            print("data", data)

            if len(data) is not 0:
                return {'status': 200, 'Message': 'User supprimé', 'UserId': str(data[0][0]),
                        'UserName': str(data[0][1]), 'UserStatus': str(data[0][2])}
            else:
                return {'status': 1000, 'Message': 'Echec authentification'}

        except Exception as e:
            return {'error': str(e)}


class AuthenticateUser(Resource):
    def post(self):
        try:
            # Parse the arguments

            parser = reqparse.RequestParser()
            parser.add_argument('user_name', type=str, help='UserName pour authentification')
            parser.add_argument('user_pwd', type=str, help='Password pour authentification')
            args = parser.parse_args()

            _userName = args['user_name']
            _userPassword = args['user_pwd']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spAuthenticateUser', (_userName, _userPassword,))
            data = cursor.fetchall()

            print("data", data)

            if len(data) is not 0:
                return {'status': 200, 'UserId': str(data[0][0]), 'UserName': str(data[0][1])}
            else:
                return {'status': 1000, 'Message': 'Echec authentification'}

        except Exception as e:
            return {'error': str(e)}


class GetUser(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('user_id', type=int, required=True)
            args = parser.parse_args()

            _userId = args['user_id']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spGetUser', (_userId,))
            data = cursor.fetchall()

            print("data", data)

            if len(data) is not 0:

                items_list = []
                for item in data:
                    i = {
                        'UserId': item[0],
                        'UserName': item[1],
                        'UserEmail': item[2]

                    }
                    items_list.append(i)

                return {'StatusCode': 200, 'User': items_list}
            else:

                return {'status': 1000, 'Message': 'UserId inconnu'}

        except Exception as e:
            return {'error': str(e)}


class GetAllUsers(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('user_status', type=int, required=True, default='1')
            args = parser.parse_args()

            _userStatus = args['user_status']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spGetAllUsers', (_userStatus,))
            data = cursor.fetchall()

            print("data", data)

            items_list = []

            if len(data) is not 0:

                for item in data:
                    i = {
                        'UserId': item[0],
                        'UserName': item[1],
                        'UserEmail': item[2]
                    }
                    items_list.append(i)

                return {'StatusCode': 200, 'Users': items_list}

            else:

                return {'status': 1000, 'Message': 'Aucun user trouvé'}

        except Exception as e:
            return {'error': str(e)}


class PostMessage(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('user_id', type=int)
            parser.add_argument('msg_body', type=str)
            args = parser.parse_args()

            _userId = args['user_id']
            _msgBody = args['msg_body']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spPostMessage', (_userId, _msgBody,))
            data = cursor.fetchall()

            print('PostMessage', data)

            if len(data) is 0:
                conn.commit()
                return {'StatusCode': 200, 'Message': 'Message créé'}
            else:
                return {'StatusCode': 1000, 'Message': str(data[0])}

        except Exception as e:
            return {'error': str(e)}


class GetLastTenMessages(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('user_id', type=int)
            args = parser.parse_args()

            _userId = args['user_id']

            print('_userId', _userId)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spGetLastTenMessages', (_userId,))

            data = cursor.fetchall()

            print("data", data)

            if len(data) is not 0:

                items_list = []
                for item in data:
                    i = {
                        'userName': item[0],
                        'MsgBody': item[1]
                    }
                    items_list.append(i)

                return {'StatusCode': 200, 'TenLastMessages': items_list}
            else:
                return {'StatusCode': 1000, 'Message': 'user invalide ou aucun message trouvé'}

        except Exception as e:
            return {'error': str(e)}


class CreateUser(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('user_name', type=str, help='user name')
            parser.add_argument('user_pwd', type=str, help='user password')
            parser.add_argument('user_email', type=str, help='user email')
            args = parser.parse_args()

            _userName = args['user_name']
            _userPassword = args['user_pwd']
            _userEmail = args['user_email']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spCreateUser', (_userName, _userPassword, _userEmail,))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return {'StatusCode': 200, 'Message': 'Utilisateur créé'}
            else:
                return {'StatusCode': 1000, 'Message': str(data[0])}

        except Exception as e:
            return {'error': str(e)}


class UpdateUser(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('user_id', type=int, help='user id', required=False, default='0')
            parser.add_argument('user_name', type=str, help='user name')
            parser.add_argument('user_name_new', type=str, help='new user name', required=False, default='0')
            parser.add_argument('user_pwd', type=str, help='user password')
            parser.add_argument('user_pwd_new', type=str, help='new user password', required=False, default='0')
            parser.add_argument('user_email', type=str, help='user email')
            parser.add_argument('user_email_new', type=str, help='new user email', required=False, default='0')
            args = parser.parse_args()

            _userId = args['user_id']
            _userName = args['user_name']
            _userPassword = args['user_pwd']
            _userEmail = args['user_email']
            _userNameNew = args['user_name_new']
            _userPasswordNew = args['user_pwd_new']
            _userEmailNew = args['user_email_new']

            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spUpdateUser', (
                _userId, _userName, _userPassword, _userEmail, _userNameNew, _userPasswordNew, _userEmailNew,))
            data = cursor.fetchall()

            print('UpdateUser data', data)

            if len(data) is 0:
                conn.commit()
                return {'StatusCode': 200, 'Message': 'Utilisateur maj'}
            else:
                return {'StatusCode': 1000, 'Message': str(data[0])}

        except Exception as e:
            return {'error': str(e)}


api.add_resource(CreateUser, '/CreateUser')
api.add_resource(AuthenticateUser, '/AuthenticateUser')
api.add_resource(DeleteUser, '/DeleteUser')
api.add_resource(UpdateUser, '/UpdateUser')
api.add_resource(GetUser, '/GetUser')
api.add_resource(GetAllUsers, '/GetAllUsers')
api.add_resource(PostMessage, '/PostMessage')
api.add_resource(GetLastTenMessages, '/GetLastTenMessages')

if __name__ == '__main__':
    app.run(debug=True)
