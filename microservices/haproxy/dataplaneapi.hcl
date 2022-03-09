config_version = 2

name = "legible_crawdad"

mode = "single"

dataplaneapi {
  advertised {}
}

service_discovery {
  consuls = [
    {
      Address                    = "0.0.0.0"
      Description                = ""
      Enabled                    = true
      ID                         = "1160219c-c533-419d-97e3-94d9bb5b6cc1"
      Name                       = ""
      Namespace                  = ""
      Port                       = 8500
      RetryTimeout               = 10
      ServerSlotsBase            = 10
      ServerSlotsGrowthIncrement = 10
      ServerSlotsGrowthType      = "linear"
      Token                      = ""
    },
    {
      Address                    = "0.0.0.0"
      Description                = ""
      Enabled                    = true
      ID                         = "83269cc3-dd53-4f1e-8052-bada68e4f289"
      Name                       = ""
      Namespace                  = ""
      Port                       = 8500
      RetryTimeout               = 10
      ServerSlotsBase            = 10
      ServerSlotsGrowthIncrement = 10
      ServerSlotsGrowthType      = "linear"
      Token                      = ""
    },
    {
      Address                    = "0.0.0.0"
      Description                = ""
      Enabled                    = true
      ID                         = "6cdfb882-eec8-4eb9-96b6-59154009eee5"
      Name                       = ""
      Namespace                  = ""
      Port                       = 8500
      RetryTimeout               = 10
      ServerSlotsBase            = 10
      ServerSlotsGrowthIncrement = 10
      ServerSlotsGrowthType      = "linear"
      Token                      = ""
    },
    {
      Address                    = "0.0.0.0"
      Description                = ""
      Enabled                    = true
      ID                         = "c38f7aa6-ac10-43d0-9ffc-2c50cd1a485b"
      Name                       = ""
      Namespace                  = ""
      Port                       = 8500
      RetryTimeout               = 10
      ServerSlotsBase            = 10
      ServerSlotsGrowthIncrement = 10
      ServerSlotsGrowthType      = "linear"
      Token                      = ""
    },
  ]
}
