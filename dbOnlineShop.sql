-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 22 2024 г., 20:21
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dbOnlineShop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`id`, `id_user`, `status`) VALUES
(1, 1, 'ordered'),
(2, 2, 'ordered'),
(3, 2, 'ordered'),
(4, 2, 'ordered'),
(7, 2, 'ordered'),
(8, 2, 'ordered'),
(9, 2, 'ordered'),
(10, 2, 'ordered'),
(16, 2, 'ordered'),
(17, 2, 'ordered'),
(20, 1, 'ordered'),
(23, 2, 'select'),
(24, 1, 'ordered'),
(25, 1, 'select');

-- --------------------------------------------------------

--
-- Структура таблицы `basket_products`
--

CREATE TABLE `basket_products` (
  `id` int NOT NULL,
  `id_busket` int NOT NULL,
  `id_products` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `basket_products`
--

INSERT INTO `basket_products` (`id`, `id_busket`, `id_products`, `quantity`) VALUES
(3, 2, 6, 1),
(4, 2, 4, 1),
(5, 2, 2, 1),
(6, 3, 4, 1),
(7, 4, 1, 1),
(8, 4, 5, 1),
(11, 7, 4, 1),
(12, 7, 2, 1),
(13, 7, 1, 1),
(14, 8, 4, 1),
(15, 8, 5, 1),
(16, 9, 1, 1),
(17, 9, 6, 4),
(18, 10, 4, 1),
(19, 10, 6, 1),
(20, 10, 1, 1),
(23, 12, 6, 3),
(24, 12, 1, 1),
(31, 16, 1, 1),
(32, 16, 4, 1),
(36, 1, 6, 3),
(37, 1, 2, 2),
(42, 20, 6, 1),
(43, 17, 6, 1),
(47, 24, 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'лазерные принтеры'),
(2, 'струйные принтеры'),
(3, 'термопринтеры');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_basket` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `id_basket`, `status`, `description`) VALUES
(8, 2, 10, 'подтверждённый', NULL),
(14, 2, 16, 'подтверждённый', NULL),
(15, 1, 1, 'подтверждённый', NULL),
(18, 1, 20, 'отменённый', 'нет на складе'),
(19, 2, 17, 'подтверждённый', NULL),
(22, 1, 24, 'подтверждённый', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_category` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `country` varchar(255) NOT NULL,
  `yearrelease` int DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `img_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `id_category`, `price`, `quantity`, `country`, `yearrelease`, `model`, `date`, `img_src`) VALUES
(1, 'Принтер лазерный Pantum P2518', 1, 7499, 3, 'Китай', 2008, 'P2518', '2024-04-20', 'printer1.webp'),
(2, 'Принтер лазерный Kyocera PA2000', 1, 15499, 2, 'Корея', 2013, 'PA2000', '2024-04-19', 'printer2.webp'),
(3, 'Принтер струйный Canon PIXMA G1411', 2, 16899, 0, 'Вьетнам', 2016, 'PIXMA G1411', '2024-04-20', 'printer3.webp'),
(4, 'Принтер струйный Epson EcoTank L1210', 2, 21999, 6, 'Филиппины', 2018, 'EcoTank L1210', '2024-04-21', 'printer4.webp'),
(5, 'Термотрансферный принтер этикеток нож TSC TE200', 3, 14757, 2, 'Китай', 2010, 'TE200', '2024-04-20', 'printer5.webp'),
(6, 'Принтер этикеток АТОЛ BP21', 3, 9529, 4, 'Россия', 2020, 'BP21', '2024-04-21', 'printer6.webp');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'misha', 'lomov', 'serg', 'lomov', 'lomov-2006@mail.ru', '$2y$12$k.YxlRc1Llt./v.Y2ZrTFOzlQTf8uIX6RbAlgJ7hPP36Q.uacigvi', 'admin', '2024-04-22 08:57:49', '2024-04-22 08:57:49'),
(2, 'egor', 'egor', 'egor', 'egor', 'egor@mail.ru', '$2y$12$YQivFype7c4xQXTrIe.cmukIxeUy.LdpjcDVX2IbkIfaIEQ5GsIme', 'user', '2024-04-22 08:58:25', '2024-04-22 08:58:25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `basket_products`
--
ALTER TABLE `basket_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `basket_products`
--
ALTER TABLE `basket_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
