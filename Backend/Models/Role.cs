using System.ComponentModel.DataAnnotations;

namespace SkillBridgeAPI.Models
{
    public class Role
    {
        [Key] // This tells C# this is the Primary Key (RoleId)
        public int RoleId { get; set; }
        public string RoleName { get; set; } = string.Empty;
        public ICollection<RoleSkill> RoleSkills { get; set; }= new List<RoleSkill>();
    }
}
