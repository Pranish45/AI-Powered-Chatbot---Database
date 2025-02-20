Create database chatbot;
use chatbot;
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Conversations (
    conversation_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Messages (
    message_id SERIAL PRIMARY KEY,
    conversation_id INT REFERENCES Conversations(conversation_id) ON DELETE CASCADE,
    sender_type VARCHAR(10) CHECK (sender_type IN ('user', 'bot')),
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE QueryPatterns (
    pattern_id SERIAL PRIMARY KEY,
    query_text VARCHAR(512) UNIQUE NOT NULL,
    frequency INT DEFAULT 1
);

CREATE TABLE ChatbotResponses (
    response_id SERIAL PRIMARY KEY,
    query_pattern_id INT REFERENCES QueryPatterns(pattern_id) ON DELETE CASCADE,
    response_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AIModelIntegration (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(255) NOT NULL,
    version VARCHAR(50) NOT NULL,
    deployed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data for Testing
INSERT INTO Users (username, email) VALUES
('JohnDoe', 'john@example.com'),
('JaneDoe', 'jane@example.com'),
('AliceSmith', 'alice@example.com'),
('BobBrown', 'bob@example.com'),
('CharlieParker', 'charlie@example.com'),
('DavidClark', 'david@example.com'),
('EveAdams', 'eve@example.com'),
('FrankMiller', 'frank@example.com'),
('GraceLee', 'grace@example.com'),
('HenryTurner', 'henry@example.com');

INSERT INTO Conversations (user_id) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO Messages (conversation_id, sender_type, message_text) VALUES
(1, 'user', 'Hello!'),
(1, 'bot', 'Hi! How can I assist you?'),
(2, 'user', 'What are your working hours?'),
(2, 'bot', 'We are available 24/7!'),
(3, 'user', 'How do I reset my password?'),
(3, 'bot', 'Go to settings and click "Reset Password".'),
(4, 'user', 'Tell me a joke!'),
(4, 'bot', 'Why did the scarecrow win an award? Because he was outstanding in his field!'),
(5, 'user', 'Can I speak to an agent?'),
(5, 'bot', 'Sure, connecting you now.');

INSERT INTO QueryPatterns (query_text, frequency) VALUES
('How to reset my password?', 50),
('What are your working hours?', 30),
('How do I contact support?', 25),
('Tell me a joke!', 20),
('What services do you offer?', 18),
('How do I change my email?', 15),
('Can I delete my account?', 12),
('Where is my order?', 10),
('How do I update my profile?', 9),
('Do you offer refunds?', 8);

INSERT INTO ChatbotResponses (query_pattern_id, response_text) VALUES
(1, 'Go to settings and click "Reset Password".'),
(2, 'We are available 24/7!'),
(3, 'You can contact support at support@example.com.'),
(4, 'Why did the scarecrow win an award? Because he was outstanding in his field!'),
(5, 'We offer AI chatbot solutions and support services.'),
(6, 'Go to your account settings to change your email.'),
(7, 'Sorry, account deletion is not supported yet.'),
(8, 'Check your order status in the "Orders" section.'),
(9, 'Update your profile information in account settings.'),
(10, 'Refunds are available under our 30-day policy.');

INSERT INTO AIModelIntegration (model_name, version) VALUES
('GPT-4', '4.0.0'),
('BERT', '2.1.0'),
('DialogFlow', '1.3.5'),
('OpenAI Chatbot', '3.2.1'),
('Watson AI', '2.5.0'),
('Rasa NLU', '1.8.2'),
('Lex AI', '2.0.1'),
('T5 Transformer', '1.6.3'),
('XLM-Roberta', '2.2.0'),
('FastChat', '1.1.4');

-- Sample Queries to Test
-- 1. Get All Users
SELECT * FROM Users;

-- 2. Get Conversations and Their Users
SELECT c.conversation_id, u.username, c.started_at 
FROM Conversations c 
JOIN Users u ON c.user_id = u.user_id;

-- 3. Get All Messages for a Specific Conversation
SELECT m.message_id, m.sender_type, m.message_text, m.sent_at 
FROM Messages m 
WHERE m.conversation_id = 1;

-- 4. Find Frequently Asked Queries
SELECT query_text, frequency 
FROM QueryPatterns 
ORDER BY frequency DESC;
