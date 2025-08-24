from flask import Flask, render_template_string

app = Flask(__name__)

@app.route('/')
def home():
    return render_template_string("""
    <!DOCTYPE html>
    <html>
    <head>
        <title>🚀 VinCloudOps</title>
        <style>
            body {
                background: linear-gradient(to right, #1f4037, #99f2c8);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #fff;
                text-align: center;
                padding-top: 100px;
            }
            h1 {
                font-size: 3em;
                margin-bottom: 0.2em;
            }
            p {
                font-size: 1.5em;
                font-weight: 300;
            }
            .box {
                background: rgba(255, 255, 255, 0.1);
                border-radius: 10px;
                display: inline-block;
                padding: 40px;
                box-shadow: 0 8px 16px rgba(0,0,0,0.3);
                max-width: 600px;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <div class="box">
            <h1>👋 Hiii, I’m Vinay</h1>
            <p>Aspiring Cloud & DevOps Engineer</p>
            <p>Deployed using <strong>Jenkins + Docker + ECS</strong></p>
        </div>
    </body>
    </html>
    """)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
