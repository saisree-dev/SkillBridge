using System.ComponentModel.DataAnnotations;

namespace SkillBridgeAPI.Models
{
    public class Skill
    {
        [Key]
        public int SkillId { get; set; }
        public string SkillName { get; set; } = string.Empty;
        public ICollection<RoleSkill> RoleSkills { get; set; } = new List<RoleSkill>();
    }
}
