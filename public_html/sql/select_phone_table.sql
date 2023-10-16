SELECT
  PHONEPRICE.MODEL,
  MAX(PHONEPRICE.STORAGESIZE) AS STORAGESIZE,
  MAX(PHONEPRICE.MEMORY) AS MEMORY,
  MAX(PHONEPRICE.PRICE) AS PRICE,
  MAX(PHONEWEIGHT.RELEASEDATE) AS RELEASEDATE,
  MAX(PHONEWEIGHT.WEIGHT) AS WEIGHT,
  MAX(PRODUCESCOMPANY.COMPANYNAME) AS COMPANYNAME,
  MAX(SPECSOS.OS) AS OS,
  MAX(SPECSDISPLAY.LENGTH) AS LENGTH,
  MAX(SPECSDISPLAY.WIDTH) AS WIDTH,
  MAX(SPECSDISPLAY.DISPLAYTYPE) AS DISPLAYTYPE,
  MAX(SPECSPROCESSOR.PROCESSOR) AS PROCESSOR,
  MAX(SPECSOS.CHARGINGPORT) AS CHARGINGPORT
FROM
  PHONEPRICE,
  SPECSPROCESSOR,
  PRODUCESCOMPANY,
  PHONEWEIGHT,
  SPECSOS,
  SPECSDISPLAY
WHERE
  PHONEPRICE.MODEL = PHONEWEIGHT.MODEL
  AND SPECSPROCESSOR.PROCESSOR = SPECSOS.PROCESSOR
  AND SPECSPROCESSOR.LENGTH = SPECSDISPLAY.LENGTH
  AND SPECSPROCESSOR.WIDTH = SPECSDISPLAY.WIDTH
  AND SPECSPROCESSOR.DISPLAYTYPE = SPECSDISPLAY.DISPLAYTYPE
  AND PHONEPRICE.MODEL = SPECSPROCESSOR.MODEL
  AND PHONEPRICE.MODEL = PRODUCESCOMPANY.MODEL
GROUP BY
  PHONEPRICE.MODEL;