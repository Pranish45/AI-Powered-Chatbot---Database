AI-Powered Chatbot Database
Overview
This project provides a structured relational database schema for an AI-powered chatbot. It efficiently stores user queries, chatbot responses, conversations, and AI model versions, allowing for better query tracking, auditing, and response improvement.

Key Features
User & Conversation Tracking: Maintains user details and conversation logs.
Message Logging: Stores individual messages exchanged between users and the chatbot.
Query Pattern Analysis: Identifies frequently asked questions for response optimization.
Chatbot Response Management: Enables storing chatbot responses for training and refinement.
AI Model Integration: Tracks different AI models, versions, and updates.
Database Schema
The database consists of six tables:

Users – Stores chatbot users.
Conversations – Logs chatbot-user conversations.
Messages – Stores individual messages exchanged in a conversation.
QueryPatterns – Tracks frequently asked queries for analysis.
ChatbotResponses – Stores chatbot-generated responses for training.
AIModelIntegration – Maintains AI model details, versions, and deployment info.
