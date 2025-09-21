public with sharing class ExchangeRateResponseWrapper {
    
    public String result { get; set; }
    public String provider { get; set; }
    public String documentation { get; set; }
    public String terms_of_use { get; set; }
    public Long time_last_update_unix { get; set; }
    public String time_last_update_utc { get; set; }
    public Long time_next_update_unix { get; set; }
    public String time_next_update_utc { get; set; }
    public Long time_eol_unix { get; set; }
    public String base_code { get; set; }
    public Map<String, Decimal> rates { get; set; }


}