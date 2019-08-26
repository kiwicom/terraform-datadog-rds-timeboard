resource "datadog_timeboard" "rds_timeboard" {
  title       = "RDS ${var.database_identifier} timeboard"
  description = "Timeboard for RDS ${var.database_identifier}"
  count       = var.create_dashboard ? 1 : 0

  # 0
  graph {
    request {
      q = "avg:aws.rds.cpuutilization.total{dbinstanceidentifier:${var.database_identifier}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "CPU Utilization (%)"
    viz   = "timeseries"
  }

  # 1
  graph {
    request {
      q = "avg:aws.rds.database_connections{dbinstanceidentifier:${var.database_identifier}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "DB connections (count)"
    viz   = "timeseries"
  }

  # 2
  graph {
    request {
      q = "avg:aws.rds.memory.total{dbinstanceidentifier:${var.database_identifier}}/1024/1024"

      style = {
        palette = "warm"
        width   = "normal"
        type    = "dotted"
      }
    }

    request {
      q = "avg:aws.rds.freeable_memory{dbinstanceidentifier:${var.database_identifier}}/1024/1024/1024"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:aws.rds.memory.free{dbinstanceidentifier:${var.database_identifier}}/1024/1024"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:aws.rds.memory.cached{dbinstanceidentifier:${var.database_identifier}}/1024/1024"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Memory Usage (GB)"
    viz   = "timeseries"
  }

  # 3
  graph {
    request {
      q = "avg:aws.rds.total_storage_space{dbinstanceidentifier:${var.database_identifier}}"

      style = {
        palette = "warm"
        width   = "normal"
        type    = "dotted"
      }
    }

    request {
      q = "avg:aws.rds.free_storage_space{dbinstanceidentifier:${var.database_identifier}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Storage usage (GB)"
    viz   = "timeseries"
  }

  # 4
  graph {
    request {
      q = "avg:postgresql.temp_bytes{host:rds,${var.hostname}}/1024/1024"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Temp files size (MB)"
    viz   = "timeseries"
  }

  # 5
  graph {
    request {
      q = "avg:aws.rds.read_iops{dbinstanceidentifier:${var.database_identifier}}.as_rate(), avg:aws.rds.write_iops{dbinstanceidentifier:${var.database_identifier}}.as_rate(), avg:aws.rds.read_iops{dbinstanceidentifier:${var.database_identifier}}.as_rate()+avg:aws.rds.write_iops{dbinstanceidentifier:${var.database_identifier}}.as_rate()"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "IOPs (count/s)"
    viz   = "timeseries"
  }

  # 6
  graph {
    request {
      q = "avg:aws.rds.read_throughput{dbinstanceidentifier:${var.database_identifier}}.as_rate(), avg:aws.rds.write_throughput{dbinstanceidentifier:${var.database_identifier}}.as_rate(), avg:aws.rds.read_throughput{dbinstanceidentifier:${var.database_identifier}}.as_rate()+avg:aws.rds.write_throughput{dbinstanceidentifier:${var.database_identifier}}.as_rate()"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Throughput (MB/s)"
    viz   = "timeseries"
  }

  # 7
  graph {
    request {
      q = "avg:aws.rds.read_latency{dbinstanceidentifier:${var.database_identifier}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:aws.rds.write_latency{dbinstanceidentifier:${var.database_identifier}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Latency (ms)"
    viz   = "timeseries"
  }

  # 8
  graph {
    request {
      q = "avg:aws.rds.network_receive_throughput{dbinstanceidentifier:${var.database_identifier}}.as_count(), avg:aws.rds.network_transmit_throughput{dbinstanceidentifier:${var.database_identifier}}.as_count()"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Network (MB/s)"
    viz   = "timeseries"
  }

  # 9
  graph {
    request {
      q = "avg:postgresql.rows_returned{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.rows_inserted{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.rows_updated{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.rows_deleted{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.rows_fetched{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Query results statistics (count/s)"
    viz   = "timeseries"
  }

  # 10
  graph {
    request {
      q = "avg:postgresql.locks{host:rds,${var.hostname}} by {lock_mode}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Locks (avg count)"
    viz   = "timeseries"
  }

  # 11
  graph {
    request {
      q = "avg:postgresql.commits{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.rollbacks{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Commits & Rollbacks (count/s)"
    viz   = "timeseries"
  }

  # 12
  graph {
    request {
      q = "avg:postgresql.custom.active_sessions{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "max:postgresql.custom.idle_sessions{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "max:postgresql.custom.idle_in_transaction_sessions{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Sessions (count)"
    viz   = "timeseries"
  }

  # 13
  graph {
    request {
      q = "avg:postgresql.custom.long_running_queries_1h{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.custom.long_running_queries_4h{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    request {
      q = "avg:postgresql.custom.long_running_queries_8h{host:rds,${var.hostname}}"

      style = {
        palette = "dog_classic"
        width   = "normal"
        type    = "solid"
      }
    }

    title = "Long running queries (count)"
    viz   = "timeseries"
  }

  # 14
  graph {
    request {
      q    = "top(sum:postgresql.custom.largest_tables{host:rds,${var.hostname}} by {relation}, 100, 'last', 'desc')"
      type = ""

      style = {
        palette = "dog_classic"
      }
    }

    title = "Relations (GB)"
    viz   = "toplist"
  }

  # 15
  graph {
    request {
      q    = "top(avg:postgresql.custom.unused_indexes{host:rds,${var.hostname}} by {index_name,table_name}, 100, 'last', 'desc')"
      type = ""

      style = {
        palette = "dog_classic"
      }
    }

    title = "Unused indexes (GB)"
    viz   = "toplist"
  }

  # 16
  graph {
    request {
      q    = "top(avg:postgresql.custom.duplicite_indexes{host:rds,${var.hostname}} by {index_1,index_2}, 100, 'last', 'desc')"
      type = ""

      style = {
        palette = "dog_classic"
      }
    }

    title = "Duplicite indexes (GB)"
    viz   = "toplist"
  }

  #17
  graph {
    request {
      q    = "top(avg:postgresql.custom.possible_missing_indexes{host:rds,${var.hostname}} by {relation_name}, 100, 'last', 'desc')"
      type = ""

      style = {
        palette = "dog_classic"
      }
    }

    title = "Tables with possible missing index (size of table in GB)"
    viz   = "toplist"
  }
}
