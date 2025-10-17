{
  lsp.servers.jdtleng = {
    enable = true;
    activate = true;
    config = {
      cmd = [
        "jdtls"
      ];
      filetypes = ["java"];
      root_markers = [".git" "mvnw" "gradlew" "pom.xml" "build.gradle"];
    };
  };
}
