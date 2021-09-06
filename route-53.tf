#===============CRIAÇÃO ROUTE 53===============#

resource "aws_route53_record" "vdep-API" {
  zone_id = "Z00892882FUUMIJ25W8YA"
  name    = "URL.cf"
  type    = "A"

  alias {
    name                   = "DNS"
    zone_id                = "Z26RNL4JYFTOTI"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "vdep-Grafana" {
  zone_id = "Z00892882FUUMIJ25W8YA"
  name    = "URL.cf"
  type    = "A"

  alias {
    name                   = "DNS"
    zone_id                = "Z26RNL4JYFTOTI"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "vdep-Alertmanager" {
  zone_id = "Z00892882FUUMIJ25W8YA"
  name    = "URL.cf"
  type    = "A"

  alias {
    name                   = "DNS"
    zone_id                = "Z26RNL4JYFTOTI"
    evaluate_target_health = true
  }
}