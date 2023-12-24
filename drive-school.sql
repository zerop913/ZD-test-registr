-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 24 2023 г., 20:35
-- Версия сервера: 8.0.33
-- Версия PHP: 8.2.9
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- База данных: `drive-school`
--
-- --------------------------------------------------------
--
-- Структура таблицы `attendance`
--
CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `id_student` int NOT NULL,
  `date` date NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `cars`
--
CREATE TABLE `cars` (
  `id` int NOT NULL,
  `make` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `year` int NOT NULL,
  `number` varchar(6) NOT NULL,
  `condition` varchar(20) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `contracts`
--
CREATE TABLE `contracts` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `id_student` int NOT NULL,
  `date_of_conclusion` date NOT NULL,
  `sum_of_payment` int NOT NULL,
  `id_status` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `courses`
--
CREATE TABLE `courses` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `id_teacher` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `exams`
--
CREATE TABLE `exams` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `result` int NOT NULL,
  `id_student` int NOT NULL,
  `id_car` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `status`
--
CREATE TABLE `status` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `students`
--
CREATE TABLE `students` (
  `id_user` int NOT NULL,
  `group` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `teachers`
--
CREATE TABLE `teachers` (
  `id_car` int NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `id_user` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Структура таблицы `users`
--
CREATE TABLE `users` (
  `id` int NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `patronymic` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--
--
-- Индексы таблицы `attendance`
--
ALTER TABLE
  `attendance`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `attendance_fk0` (`id_course`),
ADD
  KEY `attendance_fk1` (`id_student`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE
  `cars`
ADD
  PRIMARY KEY (`id`);

--
-- Индексы таблицы `contracts`
--
ALTER TABLE
  `contracts`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `contracts_fk0` (`id_course`),
ADD
  KEY `contracts_fk1` (`id_student`),
ADD
  KEY `contracts_fk2` (`id_status`);

--
-- Индексы таблицы `courses`
--
ALTER TABLE
  `courses`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `courses_fk0` (`id_teacher`);

--
-- Индексы таблицы `exams`
--
ALTER TABLE
  `exams`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `exams_fk0` (`id_course`),
ADD
  KEY `exams_fk1` (`id_student`),
ADD
  KEY `exams_fk2` (`id_car`);

--
-- Индексы таблицы `status`
--
ALTER TABLE
  `status`
ADD
  PRIMARY KEY (`id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE
  `students`
ADD
  PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE
  `teachers`
ADD
  PRIMARY KEY (`id_user`),
ADD
  KEY `teachers_fk0` (`id_car`);

--
-- Индексы таблицы `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--
--
-- AUTO_INCREMENT для таблицы `attendance`
--
ALTER TABLE
  `attendance`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE
  `cars`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `contracts`
--
ALTER TABLE
  `contracts`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE
  `courses`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exams`
--
ALTER TABLE
  `exams`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE
  `status`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--
--
-- Ограничения внешнего ключа таблицы `attendance`
--
ALTER TABLE
  `attendance`
ADD
  CONSTRAINT `attendance_fk0` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
ADD
  CONSTRAINT `attendance_fk1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `contracts`
--
ALTER TABLE
  `contracts`
ADD
  CONSTRAINT `contracts_fk0` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
ADD
  CONSTRAINT `contracts_fk1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`),
ADD
  CONSTRAINT `contracts_fk2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`);

--
-- Ограничения внешнего ключа таблицы `courses`
--
ALTER TABLE
  `courses`
ADD
  CONSTRAINT `courses_fk0` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `exams`
--
ALTER TABLE
  `exams`
ADD
  CONSTRAINT `exams_fk0` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
ADD
  CONSTRAINT `exams_fk1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`),
ADD
  CONSTRAINT `exams_fk2` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE
  `students`
ADD
  CONSTRAINT `students_fk0` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE
  `teachers`
ADD
  CONSTRAINT `teachers_fk0` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`),
ADD
  CONSTRAINT `teachers_fk1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;