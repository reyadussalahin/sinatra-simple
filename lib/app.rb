class MyApp < Sinatra::Application
  get "/" do
    <<-HTML
      <p>My first sinatra application</p>
      <p>I am just amazed how easy to build a webapp using sinatra</p>
    HTML
  end
  
  post "/json/?" do
    params.to_json
  end
end