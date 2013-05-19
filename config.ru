use Rack::Static,
  :urls => ["/css", "/js", "/images"],
  :root => "."

run Proc.new { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}
