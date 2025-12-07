namespace C_TweaksPs1.Models
{
    /// <summary>
    /// Represents the complete configuration of all available tweaks.
    /// </summary>
    public class TweakConfig
    {
        /// <summary>
        /// Dictionary of tweaks, keyed by their unique identifier.
        /// </summary>
        public Dictionary<string, Tweak> Tweaks { get; set; } = new();
    }
}
