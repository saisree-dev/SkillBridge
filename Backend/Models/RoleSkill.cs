using System.ComponentModel.DataAnnotations;

namespace SkillBridgeAPI.Models
{
    public class RoleSkill
    {
        [Key]
        public int RoleSkillId { get; set; }
        public int RoleId { get; set; }
        public int SkillId { get; set; }
        public Role Role { get; set; } = null!;
    public Skill Skill { get; set; } = null!;
    }
}
