module Lita
  module Handlers
    class Janky < Handler

      route(/ci\??$/i, :help, command: true, help: {
        'ci' => 'shows the help'
      })

      route(/ci build ([-_\.0-9a-zA-Z]+)(\/([-_\+\.a-zA-z0-9\/]+))?/i, :build, command: true, help: {
        'ci build REPO' => 'builds master branch for a given repo',
        'ci build REPO/BRANCH' => 'builds given branch for a given repo',
        'ci build REPO/SHA' => 'builds given SHA for a given repo'
      })

      route(/ci setup ([\.\-\/_a-z0-9]+)(\s([\.\-_a-z0-9]+)(\s([\.\-_a-z0-9]+))?)?/i, :setup, command: true, help: {
        'ci setup USER/REPO' => 'sets up a Jenkins job and webhook for a repository',
        'ci setup USER/REPO NAME' => 'sets up a Jenkins job and webhook for a repository with given name',
        'ci setup USER/REPO NAME TEMPLATE' => 'sets up a Jenkins job and webhook for a repository with given name and given template'
      })

      route(/ci toggle ([-_\.0-9a-zA-Z]+)/i, :toggle, command: true, help: {
        'ci toggle REPO' => 'enable/disable automatic builds for a given repo',
      })

      route(/ci set room ([-_0-9a-zA-Z\.]+) (.*)$/i, :room, command: true, help: {
        'ci set room REPO ROOM' => 'sets room where notifications are sent',
      })

      route(/ci (set) context ([-_0-9a-zA-Z\.]+) (.*)$/i, :context, command: true, help: {
        'ci set context REPO CONTEXT' => 'sets context for a given repo'
      })

      route(/ci (unset) context ([-_0-9a-zA-Z\.]+)$/i, :context, command: true, help: {
        'ci unset context REPO' => 'unsets context for a given repo'
      })

      route(/ci rooms$/i, :rooms, command: true, help: {
        'ci rooms' => 'lists available rooms to send notifications'
      })

      route(/ci builds ([0-9]+) ?(building)?$/i, :builds, command: true, help: {
        'ci builds LIMIT' => 'shows last builds',
        'ci builds LIMIT building' => 'shows last builds in building status'
      })

      route(/ci status( (\*\/[-_\+\.a-zA-z0-9\/]+))?$/i, :status, command: true, help: {
        'ci status' => 'shows last build status for each repo',
        'ci status */REPO' => 'shows last build status for given repo'
      })

      route(/ci status (-v )?([-_\.0-9a-zA-Z]+)(\/([-_\+\.a-zA-z0-9\/]+))?/i, :repo_status, command: true, help: {
        'ci status REPO' => 'shows last build status for a given repo',
        'ci status REPO/BRANCH' => 'shows last build status for a given repo and branch',
        'ci status REPO/SHA' => 'shows last build status for a given repo and sha',
        'ci status -v REPO' => 'shows last five build status for a given repo'
      })

      route(/ci show ([-_\.0-9a-zA-Z]+)/i, :show, command: true, help: {
        'ci show REPO' => 'shows configuration for a configured repo'
      })

      route(/ci delete ([-_\.0-9a-zA-Z]+)/i, :delete, command: true, help: {
        'ci delete REPO' => 'deletes a given repo'
      })

      http.post '/janky', :post_message
    end

    Lita.register_handler(Janky)
  end
end
