class GearmanBacklog < Scout::Plugin
  needs 'net/telnet'
  OPTIONS=<<-EOS
    host:
      name: Host
      default: localhost
      notes: Hostname or IP address of the Gearman job server
    port:
      name Port
      default: 4730
  EOS
  def build_report
    telnet = Net::Telnet::new("Host" => option(:host), "Port" => option(:port))
    status = telnet.cmd("String" => "status", "Match" => /\n./)
    status.split("\n")[0...-1].map do |job|
      name, total, running, workers = job.split("\t")
      report(name => total)
    end
  end
end
