# frozen_string_literal: true

module I18nLinter
  class Constants
    HTTP_HEADERS = %w[
      Accept
      Accept-Charset
      Accept-Encoding
      Accept-Language
      Accept-Ranges
      Access-Control-Allow-Credentials
      Access-Control-Allow-Headers
      Access-Control-Allow-Methods
      Access-Control-Allow-Origin
      Access-Control-Expose-Headers
      Access-Control-Max-Age
      Access-Control-Request-Headers
      Access-Control-Request-Method
      Age
      Allow
      Alt-Svc
      Authorization
      Cache-Control
      Clear-Site-Data
      Connection
      Content-Disposition
      Content-Encoding
      Content-Language
      Content-Length
      Content-Location
      Content-Range
      Content-Security-Policy
      Content-Security-Policy-Report-Only
      Content-Type
      Cookie
      Cookie2
      DNT
      Date
      ETag
      Early-Data
      Expect
      Expect-CT
      Expires
      Feature-Policy
      Forwarded
      From
      Host
      If-Match
      If-Modified-Since
      If-None-Match
      If-Range
      If-Unmodified-Since
      Index
      Keep-Alive
      Large-Allocation
      Last-Modified
      Location
      Origin
      Pragma
      Proxy-Authenticate
      Proxy-Authorization
      Public-Key-Pins
      Public-Key-Pins-Report-Only
      Range
      Referer
      Referrer-Policy
      Retry-After
      Sec-WebSocket-Accept
      Server
      Server-Timing
      Set-Cookie
      Set-Cookie2
      SourceMap
      Strict-Transport-Security
      TE
      Timing-Allow-Origin
      Tk
      Trailer
      Transfer-Encoding
      Upgrade-Insecure-Requests
      User-Agent
      Vary
      Via
      WWW-Authenticate
      Warning
      X-Content-Type-Options
      X-DNS-Prefetch-Control
      X-Forwarded-For
      X-Forwarded-Host
      X-Forwarded-Proto
      X-Frame-Options
      X-XSS-Protection
    ].freeze

    QUERY_METHODS = %w[
      annotate find find_by create_with distinct eager_load extending extract_associated from group
      having includes joins left_outer_joins limit lock none offset optimizer_hints order
      preload readonly references reorder reselect reverse_order select where
    ].freeze
  end
end
