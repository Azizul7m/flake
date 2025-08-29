{
  enable = true;
  settings = {
    provider = "gemini";
    providers = {
       gemini = {
        model = "gemini-2.0-flash";
        api_key_name = "GEMINI_API_KEY";
        input = {
           provider = "dressing";
        };
      };
    openrouter = {
        __inherited_from = "openai";
        endpoint = "https://openrouter.ai/api/v1";
        api_key_name = "OPENROUTER_API_KEY";
        model = "deepseek/deepseek-r1";
     };
    };
  };
}



