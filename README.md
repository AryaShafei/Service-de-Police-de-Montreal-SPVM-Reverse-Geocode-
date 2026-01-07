ONGOING:

As a personal project, I am analyzing trends and patterns of Criminal offences having occured in the Montreal region, between 2020 and 2025. This project is being done in Power BI, 
as the data visualization will best allow the public to understand the severity of crimes occuring across the many areas of the Montreal region. Due to the dataset only including the
the spatial coordinates (Latitude/Longitude) of incident addresses, graphics beyond geospatial mapping were limited. For this reason, I am performing a reverse geocode in R for all of the
incidents which had available spatial coordinates. Nomatim was used to reverse geocode, as i did not have access to APIs with faster and larger rate limits. Being a pulbic API, Nomatim's
rate limit is at a maximum of 1 request per second, for over 76,000 rows of data in my dataset. 
