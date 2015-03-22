require "spec_helper"

describe Lita::Handlers::Janky, lita_handler: true do
  it { is_expected.to route_command('Ci').to(:help) }
  it { is_expected.to route_command('cI?').to(:help) }

  it { is_expected.to route_command('ci build janky').to(:build) }
  it { is_expected.to route_command('ci build janky/branch').to(:build) }
  it { is_expected.to route_command('ci build janky/a345g7f').to(:build) }

  it { is_expected.to route_command('ci setup github/janky').to(:setup) }
  it { is_expected.to route_command('ci setup github/janky janky-ruby1.9.2').to(:setup) }
  it { is_expected.to route_command('ci setup github/janky janky-ruby1.9.2 ruby-build').to(:setup) }

  it { is_expected.to route_command('ci toggle janky').to(:toggle) }

  it { is_expected.to route_command('ci set room janky The Serious Room').to(:room) }
  it { is_expected.not_to route_command('ci set room janky').to(:room) }

  it { is_expected.to route_command('ci set context janky ci/janky').to(:context) }

  it { is_expected.to route_command('ci unset context janky').to(:context) }

  it { is_expected.to route_command('ci rooms').to(:rooms) }

  it { is_expected.to route_command('ci builds 1').to(:builds) }
  it { is_expected.to route_command('ci builds 1 building').to(:builds) }

  it { is_expected.to route_command('ci status').to(:status) }
  it { is_expected.to route_command('ci status */master').to(:status) }
  it { is_expected.not_to route_command('ci status janky/master').to(:status) }

  it { is_expected.to route_command('ci status janky').to(:repo_status) }
  it { is_expected.to route_command('ci status janky/master').to(:repo_status) }
  it { is_expected.to route_command('ci status -v janky/master').to(:repo_status) }
  it { is_expected.not_to route_command('ci status */master').to(:repo_status) }

  it { is_expected.to route_command('ci show janky').to(:show) }

  it { is_expected.to route_command('ci delete janky').to(:delete) }

  it { is_expected.to route_http(:post, '/janky').to(:post_message) }
end
