<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Soil.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Card Styling */
        .service-card {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }

        .service-card h1 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        .service-card h2 {
            color: #333;
            margin-top: 20px;
            margin-bottom: 10px;
            text-align: left;
        }

        .service-card p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 20px;
            text-align: justify;
        }

        .service-card ul {
            list-style-type: disc;
            padding-left: 20px;
            margin-top: 10px;
            margin-bottom: 20px;
            color: #555;
        }

        .service-card ul li {
            margin-bottom: 10px;
        }

        .service-card .key-features {
            margin-top: 20px;
        }

        .service-card .key-features li {
            margin-bottom: 10px;
        }
    </style>

    <div class="service-card">
        <h1>AI-Powered Mental Health Companion</h1>
        <h2>Description:</h2>
        <p>
            Mental health challenges are often underdiagnosed or ignored due to stigma and lack of awareness. 
            The AI-powered mental health companion provides real-time emotional support, early stress detection, 
            and personalized wellness recommendations.
        </p>
        <h2>Objective:</h2>
        <p>
            Design a digital platform that promotes mental well-being by offering real-time mood detection, 
            personalized suggestions, and proactive crisis support. The app aims to:
        </p>
        <ul>
            <li>Analyze user input to identify stress, anxiety, or depression patterns.</li>
            <li>Suggest tailored wellness activities to improve emotional health.</li>
            <li>Encourage self-awareness and consistent engagement through gamification.</li>
        </ul>
        <div class="features">
    <!-- Gamified Mood Tracking Feature -->
        <div>
            <a href="GamifiedMoodTracking.aspx" style="text-decoration: none; color: inherit;">
                <img src="images/Sudoku.jpg" alt="Gamified Mood Tracking Feature" />
                <h3>Gamified Mood Tracking Feature</h3>
            </a>           
        </div>
    </div>
     <p>Track your mood with our intelligent system that analyzes your responses, helping you spot patterns in stress, anxiety, and other emotions for better self-awareness.</p>
            <p><strong>Earn Badges!</strong> Stay engaged with your wellness journey by earning badges for consistent journaling, completing wellness tasks, and tracking your progress. Achieve new milestones as you improve your emotional well-being.</p>
    </div>

    

</asp:Content>
