CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJAQV6T33CYNPFMCQ",
    aws_secret_access_key: "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",
    region: "us-east-1"
  }
  config.fog_directory = "Project4"
end