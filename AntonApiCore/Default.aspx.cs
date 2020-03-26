using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Text;
using System.Web.Script.Serialization;

namespace AntonApiCore
{
    public partial class Default : System.Web.UI.Page
    {
        // Set the Values for API https://openweathermap.org/

        string apikey = Creds.APIKEY;
        string units =  "metric"; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default city so it dosent crash.
                Weather_temp("Växjö");
            }
        }



        double Weather_temp(string city_selected)
        {
            try { 
            // Set the url to the weather API
            string url = "https://api.openweathermap.org/data/2.5/weather?" +
                "q=" + city_selected + 
                "&appid=" + apikey +
                "&units=" + units;
            
            WebRequest request =    HttpWebRequest.Create(url);
            WebResponse response =  request.GetResponse();
            StreamReader reader =   new StreamReader(response.GetResponseStream());

            string weatherJSON =    reader.ReadToEnd();

            // Get the data from the api
            WeatherStation.WeatherStat myTemp = 
                Newtonsoft.Json.JsonConvert
                .DeserializeObject
                <WeatherStation.WeatherStat>
                (weatherJSON);


            // Return the temprature as double
            return myTemp.main.temp;
            }
            catch (Exception e)
            {
                errorBox.Visible = true;
                return 0;
            }
        }

        protected void SelectCityBtn_Click(object sender, EventArgs e)
        {
            TempLabel.Text = string.Format("{0}°C", Weather_temp(CityDropDownList.SelectedValue));
            CityLabel.Text = CityDropDownList.SelectedValue;
            TodaysDateLabel.Text = DateTime.Now.ToShortDateString();
        }
    }
}