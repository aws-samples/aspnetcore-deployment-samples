using System;
using System.Linq;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace ASPNETCoreDemo
{
    public class Program
    {
        private const string RunAsServiceFlag = "--service";
        public static int Main(string[] args)
        {
            if (args.Contains(RunAsServiceFlag))
            {
                args = args.Where(a => a != RunAsServiceFlag).ToArray();
                RunAsService(args).Build().Run();
            }
            else
            {
                RunInteractive(args).Build().Run();
            }
            return 0;
        }
        private static IHostBuilder RunInteractive(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });

        private static IHostBuilder RunAsService(string[] args)
        {
            var assemblyLocationFolder = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            if (string.Compare(Environment.CurrentDirectory, assemblyLocationFolder, StringComparison.OrdinalIgnoreCase) != 0)
            {
                Environment.CurrentDirectory = assemblyLocationFolder;
            }
            return Host.CreateDefaultBuilder(args)
                .UseWindowsService()
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
        }
    }
}
