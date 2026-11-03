-- Home Credit Default Risk: SQL analysis
-- Database: home_credit.db | Table: applications

-- 1. Overall default rate
SELECT
    COUNT(*) AS loans,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate_pct
FROM applications;

-- 2. Default rate by age group
SELECT
    AGE_GROUP,
    COUNT(*) AS loans,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate_pct
FROM applications
GROUP BY AGE_GROUP
ORDER BY AGE_GROUP;

-- 3. Default rate by education
SELECT
    NAME_EDUCATION_TYPE,
    COUNT(*) AS loans,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate_pct
FROM applications
GROUP BY NAME_EDUCATION_TYPE
ORDER BY default_rate_pct DESC;

-- 4. Default rate by income type (groups with at least 1,000 loans)
SELECT
    NAME_INCOME_TYPE,
    COUNT(*) AS loans,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate_pct
FROM applications
GROUP BY NAME_INCOME_TYPE
HAVING COUNT(*) >= 1000
ORDER BY default_rate_pct DESC;

-- 5. Default rate by employment flag
SELECT
    DAYS_EMPLOYED_MISSING,
    COUNT(*) AS loans,
    ROUND(AVG(TARGET) * 100, 2) AS default_rate_pct
FROM applications
GROUP BY DAYS_EMPLOYED_MISSING;