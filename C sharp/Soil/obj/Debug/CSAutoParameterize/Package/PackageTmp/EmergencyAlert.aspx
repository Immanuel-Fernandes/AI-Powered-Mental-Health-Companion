<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="EmergencyAlert.aspx.cs" Inherits="Soil.EmergencyAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Emergency Card Styling */
        .emergency-card {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8d7da; /* Light red for emergency theme */
            border: 1px solid #f5c6cb;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            color: #721c24; /* Dark red text */
            font-family: Arial, sans-serif;
        }

        .emergency-card h1 {
            color: #721c24;
            text-align: center;
            margin-bottom: 20px;
        }

        .emergency-card p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
            text-align: justify;
        }

        /* Emergency Table Styling */
        .emergency-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .emergency-table th, .emergency-table td {
            border: 1px solid #f5c6cb;
            padding: 10px;
            text-align: left;
        }

        .emergency-table th {
            background-color: #f5c6cb; /* Slightly darker red for headers */
            color: #721c24;
            font-weight: bold;
        }

        .emergency-table tr:nth-child(even) {
            background-color: #f9e2e3; /* Light pink for alternating rows */
        }

        .emergency-table tr:hover {
            background-color: #f1d0d2; /* Slight hover effect */
        }

        .emergency-table td {
            color: #721c24;
        }
    </style>
     <br /> <br />
    <div class="emergency-card">
        <h1>Emergency Alert - Contact Information</h1>
        <p>
            In case of emergencies, use the contact numbers below to reach the appropriate services. These numbers are critical for ensuring prompt assistance in times of need.
        </p>
        <table class="emergency-table">
            <thead>
                <tr>
                    <th>Service</th>
                    <th>Contact Number</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Police</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>Fire Station</td>
                    <td>101</td>
                </tr>
                <tr>
                    <td>Ambulance</td>
                    <td>102</td>
                </tr>
                <tr>
                    <td>Doctor on Call</td>
                    <td>+91-9876543210</td>
                </tr>
                <tr>
                    <td>Emergency Hospital</td>
                    <td>+91-1234567890</td>
                </tr>
                <tr>
                    <td>Disaster Management Helpline</td>
                    <td>108</td>
                </tr>
                <tr>
                    <td>Women’s Helpline</td>
                    <td>1091</td>
                </tr>
                <tr>
                    <td>Child Helpline</td>
                    <td>1098</td>
                </tr>
                <tr>
                    <td>Blood Bank</td>
                    <td>+91-9988776655</td>
                </tr>
            </tbody>
        </table>
        <p>
            Please keep these numbers handy and share them with your loved ones. Your safety is our priority.
        </p>
    </div>

    <br /> <br />
</asp:Content>
