use zed_extension_api as zed;

struct MestExtension;

impl zed::Extension for MestExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let path = worktree
            .which("mest-lsp")
            .ok_or_else(|| "could not find mest-lsp binary on PATH".to_string())?;

        Ok(zed::Command {
            command: path,
            args: vec![],
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(MestExtension);
